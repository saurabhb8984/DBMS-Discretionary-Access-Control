import mysql.connector
from flask import Flask, request, render_template, make_response
import csv

app = Flask(__name__)

cnx = mysql.connector.connect(user='root', password='root',host='localhost',database='security')
#cnx = mysql.connector.connect(user='root', password='root',host='localhost',database='quiz3_prep')
cursor = cnx.cursor()

@app.route('/')
def index():
	role_list = []
	owner_list = []
	accountPlist = []
	relationPlist = []
	tableList = []
	dbList = []
	plist = []
	user_list = []
	p_list =['Account Privilege','Relation Privilege']
	query = ("SELECT RoleName as roleName FROM user_role")
	cursor.execute(query)
	for roleName in cursor:
		a = ','.join(roleName)
		role_list.append(a)
	query1 = ("SELECT IDNo as IDNo FROM user_account")
	cursor.execute(query1)
	result = cursor.fetchall()
	for row in result:
		owner_list.append(row[0])
	query2 = ("SELECT PName FROM privilege where Ptype='Account Privilege'")
	cursor.execute(query2)
	result = cursor.fetchall()
	for row in result:
		accountPlist.append(row[0])	
	query3 = ("SELECT PName FROM privilege where Ptype='Relation Privilege'")
	cursor.execute(query3)
	result = cursor.fetchall()
	for row in result:
		relationPlist.append(row[0])
	query4 = ("SELECT TableName FROM tables")
	cursor.execute(query4)
	result = cursor.fetchall()
	for row in result:
		tableList.append(row[0])
	query5 = ("SELECT DISTINCT(DBName) FROM tables")
	cursor.execute(query5)
	result = cursor.fetchall()
	for row in result:
		dbList.append(row[0])
        query6 = ("SELECT PName FROM privilege")
	cursor.execute(query6)
	result = cursor.fetchall()
	for row in result:
		plist.append(row[0])
	query7 = ("SELECT IDNo,Initial,Lname,RoleName FROM user_account")
	cursor.execute(query7)
	result = cursor.fetchall()
	for row in result:
                user = row[0],row[1],row[2],row[3]
                user_list.append(user)
        print user_list
	return render_template('a2.html',owner_list=owner_list,role_list=role_list,p_list=p_list,accountPlist=accountPlist,relationPlist=relationPlist,tableList=tableList,
                               dbList=dbList,plist=plist,user_list=user_list)

@app.route('/addUserAccount', methods=['POST'])
def addUserAccount():
	passw = request.form['password']
 	initial = request.form['initial']
	lastName = request.form['lastName']
	phone = request.form['phone']
	roleName = request.form['roleName']
	idNo = request.form['idNo']
	query = "INSERT INTO user_account(IDNo,Password,Initial,Lname,Phone,RoleName) values ({0},'{1}','{2}','{3}','{4}','{5}')".format(idNo,passw,initial,lastName,phone,roleName)
        cursor.execute(query)
        cnx.commit()
        return '<h1>Account Added Successfully.</h1>'

@app.route('/addRole', methods=['POST'])
def addRole():
	roleName = request.form['roleName']
 	description = request.form['description']
	query = "INSERT INTO user_role(RoleName,Description) values ('{0}','{1}')".format(roleName,description)
        cursor.execute(query)
        cnx.commit()
        return '<h1>Role Added Successfully.</h1>'

@app.route('/addTable', methods=['POST'])
def addTable():
	tableName = request.form['tableName']
 	dbName = request.form['dbName']
        owner_id = request.form['owner_id']
	query = "INSERT INTO tables(TableName,DBName,OwnerId) values ('{0}','{1}',{2})".format(tableName,dbName,owner_id)
        cursor.execute(query)
        cnx.commit()
        return '<h1>Table Added Successfully.</h1>'

@app.route('/addPrivilege', methods=['POST'])
def addPrivilege():
	pName = request.form['pName']
 	pType = request.form['ptype']
	query = "INSERT INTO privilege(PName,PType) values ('{0}','{1}')".format(pName,pType)
        cursor.execute(query)
        cnx.commit()
        return '<h1>Privilege Added Successfully.</h1>'

@app.route('/addUserRole', methods=['POST'])
def addUserRole():
	idNo = request.form['idNo']
 	roleName = request.form['roleName']
 	query = "UPDATE user_account SET RoleName='{1}' WHERE IDNo={0}".format(idNo,roleName)
        cursor.execute(query)
        cnx.commit()
        return '<h1>User Role Added Successfully.</h1>'

@app.route('/addPrivilegeRole', methods=['POST'])
def addPrivilegeRole():
        accountPlist = []
	accountPrivilege = request.form['accountPrivilege']
 	roleName = request.form['roleName']
 	query1 = "SELECT PrivilegeId FROM Privilege WHERE PName='{0}'".format(accountPrivilege)
 	cursor.execute(query1)
	result = cursor.fetchall()
	for row in result:
		accountPlist.append(row[0])
	print accountPlist[0]
 	query = "INSERT INTO role_privilege(PrivilegeId,RoleName) values ('{0}','{1}')".format(accountPlist[0],roleName)
        cursor.execute(query)
        cnx.commit()
        return '<h1>Role Privilege Added Successfully.</h1>'

@app.route('/addPrivilegeRoleTable', methods=['POST'])
def addPrivilegeRoleTable():
        relationPList = []
	relationPName = request.form['relationPName']
 	roleName = request.form['roleName']
 	tableName = request.form['tableName']
 	dbName = request.form['dbName']
 	query1 = "SELECT PrivilegeId FROM Privilege WHERE PName='{0}'".format(relationPName)
 	cursor.execute(query1)
	result = cursor.fetchall()
	for row in result:
		relationPList.append(row[0])
 	query = "INSERT INTO table_privilege(TableName,DBName,PrivilegeId,RoleName) values ('{0}','{1}',{2},'{3}')".format(tableName,dbName,relationPList[0],roleName)
        cursor.execute(query)
        cnx.commit()
        return '<h1>Role Privilege Added Successfully.</h1>'

@app.route('/retrivePrivileges', methods=['POST'])
def retrivePrivileges():
        relationPList = []
 	roleName = request.form['roleName']
 	query1 = "SELECT p.PName FROM role_privilege rp INNER JOIN Privilege p on rp.PrivilegeId = p.PrivilegeId WHERE rp.RoleName='{0}'".format(roleName)
 	cursor.execute(query1)
	result = cursor.fetchall()
	for row in result:
		relationPList.append(row[0])
        return ','.join(map(str,relationPList))

@app.route('/rPrivilegesUserAccount', methods=['POST'])
def rPrivilegesUserAccount():
        relationPList = []
 	idNo = request.form['idNo']
 	query1 = "SELECT p.PName FROM user_account ua INNER JOIN role_privilege rp on ua.RoleName=rp.RoleName "\
                 "INNER JOIN Privilege p on rp.PrivilegeId = p.PrivilegeId WHERE ua.IDNo='{0}'".format(idNo)
 	cursor.execute(query1)
	result = cursor.fetchall()
	for row in result:
		relationPList.append(row[0])
        return ','.join(map(str,relationPList))

@app.route('/checkPrivilegeAccount', methods=['POST'])
def checkPrivilegeAccount():
        relationPList = []
	PName = request.form['PName']
 	idNo = request.form['idNo']
 	query1 = "SELECT p.PName FROM user_account ua INNER JOIN role_privilege rp on ua.RoleName=rp.RoleName "\
                 "INNER JOIN Privilege p on rp.PrivilegeId = p.PrivilegeId WHERE ua.IDNo='{0}'".format(idNo)
 	cursor.execute(query1)
	result = cursor.fetchall()
	for row in result:
                if row[0] == PName:
                         return '<h1>User Account has this Privilege.</h1>'
        return '<h1>User Account does not have this Privilege.</h1>'

@app.route('/revokePrivilegeRole', methods=['POST'])
def revokePrivilegeRole():
        relationPList = []
	PName = request.form['PName']
 	roleName = request.form['roleName']
 	query1 = "SELECT PrivilegeId FROM Privilege WHERE PName='{0}'".format(PName)
 	cursor.execute(query1)
	result = cursor.fetchall()
	for row in result:
		relationPList.append(row[0])
 	query = "DELETE FROM role_privilege WHERE  PrivilegeId={0} AND RoleName='{1}'".format(relationPList[0],roleName)
        cursor.execute(query)
        cnx.commit()
        return '<h1>Role Privilege Deleted Successfully.</h1>'

if __name__ == "__main__":
    app.run(debug=True)
    # Disconnect from the account
    client.disconnect()

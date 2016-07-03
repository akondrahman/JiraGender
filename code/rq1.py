# -*- coding: utf-8 -*-
import db_connection, os
import utility

def getAllFemaleAuthors():
 connection = db_connection.giveConnection()
 try:
    with connection.cursor() as cursor:
     sql = "SELECT DISTINCT(`id`) FROM `user` WHERE `gender`='female';"
     cursor.execute(sql)
     result = cursor.fetchall()

 finally:
   connection.close()
 return result
def getAllMaleAuthors():
 connection = db_connection.giveConnection()
 try:
    with connection.cursor() as cursor:
     sql = "SELECT DISTINCT(`id`) FROM `user` WHERE `gender`='male';"
     cursor.execute(sql)
     result = cursor.fetchall()

 finally:
   connection.close()
 return result



def preProcessauthorIDs(idListParam):
    allIDLists = []
    for dictItem in idListParam:
        author_id_ = dictItem['id']
        allIDLists.append(author_id_)
    return allIDLists

def getIssueReportFromDB(authorIDParam):
 connection = db_connection.giveConnection()
 try:
    with connection.cursor() as cursor:
     sql = "SELECT COUNT(*) AS `CNT` FROM `issue_report` WHERE `reporter_id`=%s;"
     dataTuple=(str(authorIDParam))
     cursor.execute(sql, dataTuple)
     result = cursor.fetchall()

 finally:
   connection.close()
 return result

def preProcessCount(resultParam):
    countto_ret = 0.0
    for dict_ in resultParam:
      val_ = dict_['CNT']
      if val_=='':
        countto_ret = 0.0
      else:
        countto_ret= float(val_)
    return countto_ret


def getIssueReportsList(author_id_param_list):
   resultantIssueReportList = []
   for author_id_ in author_id_param_list:
       issue_report_count = preProcessCount(getIssueReportFromDB(author_id_))
       resultantIssueReportList.append(issue_report_count)
   return resultantIssueReportList



print "Starting at:", utility.giveTimeStamp()
allTheFemales = preProcessauthorIDs(getAllFemaleAuthors())
print "Identified females:",len(allTheFemales)
allTheMales = preProcessauthorIDs(getAllMaleAuthors())
print "Identified males:",len(allTheMales)
issue_reports_for_females = getIssueReportsList(allTheFemales)
status=utility.dumpContent(issue_reports_for_females, 'F_ALL')
print "Dumped a file of {} bytes".format(status)
print "Total Female reports",sum(issue_reports_for_females)
issue_reports_for_males = getIssueReportsList(allTheMales)
status=utility.dumpContent(issue_reports_for_males, 'M_ALL')
print "Dumped a file of {} bytes".format(status)
print "Total Male reports",sum(issue_reports_for_males)
print "Ending at:", utility.giveTimeStamp()

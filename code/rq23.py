# -*- coding: utf-8 -*-
import db_connection, os
import utility

def getBugReportFromDB(authorIDParam, priorityParam):
 connection = db_connection.giveConnection()
 try:
    with connection.cursor() as cursor:
     sql = "SELECT COUNT(*) AS `CNT` FROM issue_report WHERE `reporter_id`=%s AND `type`='Bug' AND `priority`=%s;"
     dataTuple=(str(authorIDParam), str(priorityParam))
     cursor.execute(sql, dataTuple)
     result = cursor.fetchall()

 finally:
   connection.close()
 return result


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


def preProcessCount(resultParam):
    countto_ret = 0.0
    for dict_ in resultParam:
      val_ = dict_['CNT']
      if val_=='':
        countto_ret = 0.0
      else:
        countto_ret= float(val_)
    return countto_ret


def getBugReportsList(author_id_param_list, priority_):
   resultantIssueReportList = []
   for author_id_ in author_id_param_list:
       issue_report_count = preProcessCount(getBugReportFromDB(author_id_, priority_))
       resultantIssueReportList.append(issue_report_count)
   return resultantIssueReportList





print "Starting at:", utility.giveTimeStamp()
print "----------------------------------------"
###
allTheFemales = preProcessauthorIDs(getAllFemaleAuthors())
allTheMales   = preProcessauthorIDs(getAllMaleAuthors())
###
f_critical_bug_list = getBugReportsList(allTheFemales, 'Critical')
print "Total Critical Bug Count For Females:", sum(f_critical_bug_list)
status=utility.dumpContent(f_critical_bug_list, 'F_C_B')
print "Dumped a file of {} bytes".format(status)
###
f_major_bug_list = getBugReportsList(allTheFemales, 'Major')
print "Total Major Bug Count For Females:", sum(f_major_bug_list)
status=utility.dumpContent(f_major_bug_list, 'F_Ma_B')
print "Dumped a file of {} bytes".format(status)
###
f_minor_bug_list = getBugReportsList(allTheFemales, 'Minor')
print "Total Minor Bug Count For Females:", sum(f_minor_bug_list)
status=utility.dumpContent(f_minor_bug_list, 'F_Mi_B')
print "Dumped a file of {} bytes".format(status)
###
print "----------------------------------------"
print "Ending at:", utility.giveTimeStamp()

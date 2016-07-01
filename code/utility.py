# -*- coding: utf-8 -*-



import os, time, datetime
def giveTimeStamp():
  tsObj = time.time()
  strToret = datetime.datetime.fromtimestamp(tsObj).strftime('%Y-%m-%d %H:%M:%S')
  return strToret





def dumpContent(listParam, fileNameParam):
  completeStrToWrite=""
  fileParam =  fileNameParam + ".csv"
  fileToWrite = open( fileParam, 'w');
  lineStr =  "Counts"

  for item in listParam:
    lineStr = lineStr + str(item) + "\n"
  completeStrToWrite = completeStrToWrite + lineStr
  lineStr="";
  fileToWrite.write(completeStrToWrite );
  fileToWrite.close()
  return str(os.stat(fileParam).st_size)

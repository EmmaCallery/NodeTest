exports.getGPAArray = (gradeArray) ->
  gpaArray = []
  pos = 0
  for grade in gradeArray
    if grade is 'A'
      gpaArray[pos] = 4.0
      pos++
    else if grade is 'A-'
      gpaArray[pos] = 3.7
      pos++
    else if grade is 'B+'
      gpaArray[pos] = 3.3
      pos++
    else if grade is 'B'
      gpaArray[pos] = 3.0
      pos++
    else if grade is 'B-'
      gpaArray[pos] = 2.7
      pos++
    else if grade is 'C+'
      gpaArray[pos] = 2.3
      pos++
    else if grade is 'C'
      gpaArray[pos] = 2.0
      pos++
    else if grade is 'C-'
      gpaArray[pos] = 1.7
      pos++
    else if grade is 'D+'
      gpaArray[pos] = 1.3
      pos++
    else if grade is 'D'
      gpaArray[pos] = 1.0
      pos++
    else if grade is 'D-'
      gpaArray[pos] = 0.7
      pos++
    else if grade is 'F'
      gpaArray[pos] = 0
      pos++
  gpaArray

exports.getGPA = (gpaArr, creditArray) ->
  pos = 0
  for gpa in gpaArr
    gpa *= creditArray[pos]
    pos++
  sumGPA = 0
  sumGPA += gpa for gpa in gpaArr
  sumCredit = 0
  sumCredit += credit for credit in creditArray
  sumGPA/sumCredit
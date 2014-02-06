headerStr = '<!DOCTYPE html>\n
<html>\n
<head>\n
<title>A test form</title>\n
</head>\n
<body>\n'

formString = '<form method="post" action="/gpa">\n
        <input type="text" id="grades" name="grades" value="F" /><br />\n
        <input type="submit" id ="submit" value="Done" />\n
    </form>\n'

footerStr = '</body>\n</html>'

exports.getGPAArray = (gradeArray) ->
  gpaArray = []
  pos = 0
  for grade in gradeArray
    if grade is 'A'
      gpaArray[pos] = 4.0
      pos++
    if grade is 'A-'
      gpaArray[pos] = 3.7
      pos++
    if grade is 'B+'
      gpaArray[pos] = 3.3
      pos++
    if grade is 'B'
      gpaArray[pos] = 3.0
      pos++
    if grade is 'B-'
      gpaArray[pos] = 2.7
      pos++
    if grade is 'C+'
      gpaArray[pos] = 2.3
      pos++
    if grade is 'C'
      gpaArray[pos] = 2.0
      pos++
    if grade is 'C-'
      gpaArray[pos] = 1.7
      pos++
    if grade is 'D+'
      gpaArray[pos] = 1.3
      pos++
    if grade is 'D'
      gpaArray[pos] = 1.0
      pos++
    if grade is 'D-'
      gpaArray[pos] = 0.7
      pos++

    if grade is 'F'
      gpaArray[pos] = 0
      pos++
  gpaArray

exports.getGPA = (gpaArr, creditArray) ->
###Multiply the scale value by the credits to get grade points###
  pos = 0
  for gpa in gpaArr
    gpaArr[pos] *= creditArray[pos]
    pos++
###Add grade points togeather###
  sumGPA = 0
  sumGPA += gpa for gpa in gpaArr
###Add creadits togeather###
  sumCredit = 0
  sumCredit = credit for credit in creditArray
###Compute Grade Point Average###
  sumGPA/sumCredit

exports.formResponse = (req, res) ->
  res.render 'gpa'

exports.postResponse = (req, res) ->
  res.send headerStr + formString + '<p>You said ' + req.body.grades + '</p>' + footerStr
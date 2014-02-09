headerStr = '<!DOCTYPE html>\n
<html>\n
<head>\n
<title>A test form</title>\n
</head>\n
<body>\n'

formString = '<form method="post" action="/gpa">\n
        <input type="text" id="grades" name="grades" value="F" />\n
        <select id="credits" name="credits">\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select>\n
        <br />\n
        <input type="text" id="grades1" name="grades1" value="F" />\n
        <select id="credits1" name="credits1">\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select>\n
        <br />\n
        <input type="text" id="grades2" name="grades2" value="F" />\n
        <select id="credits2" name="credits2">\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select>\n
        <br />\n
        <input type="text" id="grades3" name="grades3" value="F" />\n
        <select id="credits3" name="credits3">\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select>\n
        <br />\n
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
  pos = 0
  for gpa in gpaArr
    gpa *= creditArray[pos]
    pos++
  sumGPA = 0
  sumGPA += gpa for gpa in gpaArr
  sumCredit = 0
  sumCredit += credit for credit in creditArray
  sumGPA/sumCredit

exports.formResponse = (req, res) ->
  res.render 'gpa'

exports.postResponse = (req, res) ->
  gradeArr = []
  gradeArr[0] = req.body.grades
  gradeArr[1] = req.body.grades1
  gradeArr[2] = req.body.grades2
  gradeArr[3] = req.body.grades3

  creditArr = []
  creditArr[0] = req.body.credits
  creditArr[1] = req.body.credits1
  creditArr[2] = req.body.credits2
  creditArr[3] = req.body.credits3



  res.send headerStr + formString + '<p>You have a ' + req.body.credits + ' GPA. </p>' + footerStr



















getGPAArray = require('./../routes/gpaFunctions').getGPAArray
getGPA = require("./../routes/gpaFunctions").getGPA


headerStr = '<!DOCTYPE html>\n
<html>\n
<head>\n
<title>A test form</title>\n
</head>\n
<body>\n'

formString = '<form method="post" action="/gpa">\n
        <label>Class 1: </label>\n
        <select id="grades" name="grades">\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
        <select id="credits" name="credits">\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select>\n
        <br />\n
        <label>Class 2: </label>\n
        <select id="grades1" name="grades1">\n
                <option value="A">A</option>\n
                <option value="A-">A-</option>\n
                <option value="B+">B+</option>\n
                <option value="B">B</option>\n
                <option value="B-">B-</option>\n
                <option value="C+">C+</option>\n
                <option value="C">C</option>\n
                <option value="C-">C-</option>\n
                <option value="D+">D+</option>\n
                <option value="D">D</option>\n
                <option value="D-">D-</option>\n
                <option value="F">F</option>\n
        </select>\n
        <select id="credits1" name="credits1">\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select>\n
        <br />\n
        <label>Class 3: </label>\n
        <select id="grades2" name="grades2">\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
        <select id="credits2" name="credits2">\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select>\n
        <br />\n
        <label>Class 4: </label>\n
        <select id="grades3" name="grades3">\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
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

exports.formResponse = (req, res) ->
  res.render 'gpa'

exports.postResponse = (req, res) ->
  gradeArr = []
  gradeArr[0] = req.body.grades
  gradeArr[1] = req.body.grades1
  gradeArr[2] = req.body.grades2
  gradeArr[3] = req.body.grades3

  creditArr = []
  creditArr[0] = parseFloat(req.body.credits)
  creditArr[1] = parseFloat(req.body.credits1)
  creditArr[2] = parseFloat(req.body.credits2)
  creditArr[3] = parseFloat(req.body.credits3)

  gpaArr = getGPAArray(gradeArr)

  gpa = getGPA(gpaArr,creditArr)


  res.send headerStr + formString + '<p>You have a ' + gpa.toFixed(2) + ' GPA. </p>' + footerStr



















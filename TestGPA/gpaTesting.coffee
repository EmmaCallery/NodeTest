###
  Emma Callery and Brennan Gensch' GPA Calculator Lab.
###
assert = require 'assert'
getGPAArray = require('./../routes/gpaFunctions').getGPAArray
getGPA = require("./../routes/gpaFunctions").getGPA

describe "testing getGPAArray", ->
  it "Should return an array of gpa's", ->
    assert.deepEqual(getGPAArray(['A','B','C','D','F']),[4.0,3.0,2.0,1.0,0])

describe "testing getGPA", ->
  it "Should return the gpa", ->
    assert.deepEqual(getGPA([4.0,3.0,2.0,1.0,0],[1,1,1,1,1]),2)

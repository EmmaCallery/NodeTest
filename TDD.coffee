assert = require 'assert'

#Loops and Comprehensions
sum = (arr) ->
  added = 0
  added += num for num in arr
  added

factorial = (num) ->
  fact = 1
  fact *= n for n in [1..num]
  fact


describe "testing summation", ->
  it "should add up all the numbers in an array", ->
    assert.equal(sum([1,2,3,4,5]),15)

describe "testing factorial", ->
  it "should multiply up all the numbers in an array", ->
    assert.equal(factorial(5),120)

str = (name, partner) ->
  "My name is " + name + " my partner is " + partner + "."

describe "testing string", ->
  it "should create string form contets of object", ->
    assert.equal(str("Emma","Brennan"),"My name is Emma my partner is Brennan.")

rangeOf = (min, max) ->
  [min..max]
#Ranges, slicing, and splicing
describe "testing range", ->
  it "should return the range between two numbers", ->
    assert.deepEqual(rangeOf(0,6),[0,1,2,3,4,5,6])

describe "testing negativeRange", ->
  it "should return the range between two numbers", ->
    assert.deepEqual(rangeOf(-5,0),[-5,-4,-3,-2,-1,0])

firstHalf = (arr) ->
  arr[0..arr.length / 2 - 1]

describe "testing firstHalf", ->
  it "should return the first half of an array", ->
    assert.deepEqual(firstHalf([3,6,9,12]),[3,6])

spliceHalf = (arr) ->
 arr[0..arr.length / 2 - 1] = [0,0,0]
 arr
describe "testing splicingFirstHalf", ->
  it "should return the array with the first half turned to 0", ->
    assert.deepEqual(spliceHalf([-5,-4,-3,-2,-1,0]),[0,0,0,-2,-1,0])
spliceLastHalf = (arr) ->
  arr[arr.length / 2..arr.length-1 ] = [10,10,10]
  arr
describe "testing splicingMakeTen", ->
  it "should return the array with the second half to ten", ->
    assert.deepEqual(spliceLastHalf([-5,-4,-3,-2,-1,0]),[-5,-4,-3,10,10,10])

atLeastOne = (bool1,bool2) ->
  bool1 or bool2
#aliases for operators
describe "testing atleastOneIsTrue", ->
  it "should return true if atleast one of two values is true", ->
    assert.equal(atLeastOne(true,false),true)

isequal = (x,y,z) ->
  (x + y) is z
describe "testing is", ->
  it "should return true if two values equal a thrid", ->
    assert.equal(isequal(5,6,11),true)

describe "testing isnot", ->
  it "should return true if two values equal a thrid", ->
    assert.equal(isequal(5,3,11),false)

#The Existential Operator
arr = null
testarray = (arr) ->
  arr ?= [0,0,0,0,0,0,0,0,0,0]
  arr
describe "testing ?1", ->
  it "should return array of ten zeros if array is undedined or null", ->
    assert.deepEqual(testarray(arr),[0,0,0,0,0,0,0,0,0,0])

describe "testing ?2", ->
  it "should return array of ten zeros if array is undedined or null", ->
    assert.deepEqual(testarray([1]),[1])

addTwo = (val1, val2) ->
  if val1? and val2? then val1+ val2 else "Missing input"
describe "testing ?3", ->
  it "Should add the two vaariablers unless one is undefined", ->
    assert.equal(addTwo(3, null), "Missing input")

#Destructuring Assignment

destructure = (arr) ->
  [arr[0],arr[1]] = [arr[1], arr[0]]
  arr
describe "testing switching", ->
  it "should return a reversed array", ->
    assert.deepEqual(destructure([25,52]),[52,25])

destructureAdd = (arr) ->
  arr[0] + arr[1]

describe "testing switchingAdding", ->
  it "should return addition a reversed array", ->
    assert.equal(destructureAdd([25,52]),77)

destructureSub = (arr) ->
  arr[1] - arr[0]

describe "testing switchingSub", ->
  it "should return subtraction a reversed array", ->
    assert.equal(destructureSub([25,52]),27)


#Splats
splat = (x = 0,y = 0, z = 0, w = 0) ->
  x + y + z + w
describe "testing splats", ->
  it "should splat any number for 0 in number is not givin", ->
    assert.equal(splat(2,1), 3)
    assert.equal(splat(1,2,3),6)
    assert.equal(splat(1,2,3,4),10)
require('luacov')
local assert = require('assert')
local replace = require('string.replace')

-- test that replace to empty string
assert.equal(replace('hello world!', ' world'), 'hello!')

-- test that replace to specified string
assert.equal(replace('hello world!', 'world', 'foobar'), 'hello foobar!')

-- test that replace a matched string specified number of times
assert.equal(replace('a|b|c|d|e|', '|', nil, 3), 'abcd|e|')

-- test that replace a matched string from specified position
assert.equal(replace('a|b|c|d|e|', '|', nil, nil, 5), 'a|b|cde')

-- test that do nothing if specified target length is 0
assert.equal(replace('a|b|c|d|e|', ''), 'a|b|c|d|e|')

-- test that throws an erorr if s is not string
local err = assert.throws(replace)
assert.match(err, 's must be string')

-- test that throws an error if target is not string
err = assert.throws(replace, 'foo')
assert.match(err, 'target must be string')

-- test that throws an error if rep is not string
err = assert.throws(replace, 'foo', 'o', true)
assert.match(err, 'rep must be string')

-- test that throws an error if count is not finite-number
err = assert.throws(replace, 'foo', 'o', nil, 0 / 0)
assert.match(err, 'count must be finite-number')

-- test that throws an error if init is not finite-number
err = assert.throws(replace, 'foo', 'o', nil, nil, 0 / 0)
assert.match(err, 'init must be finite-number')

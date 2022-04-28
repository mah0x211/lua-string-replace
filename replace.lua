--
-- Copyright (C) 2022 Masatoshi Fukunaga
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
-- modules
local find = string.find
local sub = string.sub
local type = type
-- constants
local INF_POS = math.huge
local INF_NEG = -INF_POS

local function is_finite(v)
    return type(v) == 'number' and (v < INF_POS and v > INF_NEG)
end

--- replace
--- @param s string
--- @param target string
--- @param rep? string
--- @param count? integer
--- @param init? integer
--- @return any
local function replace(s, target, rep, count, init)
    if type(s) ~= 'string' then
        error('s must be string', 2)
    elseif type(target) ~= 'string' then
        error('target must be string', 2)
    elseif rep == nil then
        rep = ''
    elseif type(rep) ~= 'string' then
        error('rep must be string or function')
    end

    if count == nil then
        count = 0
    elseif not is_finite(count) then
        error('count must be finite-number', 2)
    end

    if init ~= nil and not is_finite(init) then
        error('init must be finite-number', 2)
    end

    if #target == 0 then
        return s
    end

    repeat
        local head, tail = find(s, target, init, true)
        if head then
            s = sub(s, 1, head - 1) .. rep .. sub(s, tail + 1)
            init = head + #rep
            count = count - 1
        end
    until not head or count == 0

    return s
end

return replace

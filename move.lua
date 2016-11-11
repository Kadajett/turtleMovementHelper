local move = {}

-- cardinal is the four directions. Each turn will change this. 0=north, 1=east, 2=south, 3=west
local cardinal = 0

move.history = {}
-- turtle = {}
-- function turtle.turnLeft()
--  print('Turtle turning left')
--  return true
-- end
-- function turtle.turnRight()
--  print('Turtle turning Right')
--  return true
-- end
-- function turtle.forward()
--  print('Turtle moving forward')
--  return true
-- end
-- function turtle.detect()
-- return false
-- end
-- Utils

local function turtleExists(success, error)
  if turtle ~= nil then
    return success()
  end
  return error()
end

function cardinalRight()

  if cardinal < 3 then
    cardinal = cardinal + 1
  else
    cardinal = 0
  end
  callCardinal()
end



function cardinalLeft()

  if cardinal > 0 then
    cardinal = cardinal - 1
  else
    cardinal = 3
  end
  callCardinal()
end

function callCardinal()

  if cardinal == 0 then
    print('cardinal: north');
  end

  if cardinal == 1 then
    print('cardinal: east');
  end

  if cardinal == 2 then
    print('cardinal: south')
  end

  if cardinal == 3 then
    print('cardinal: west')
  end

end

callCardinal()

-- End Utils

-- Turns

function move.turnLeft(rots)

  local function tl()

    local turtle = turtle or {} -- This wont be used, but it prevents errors while debugging
    local didTurn = nil
    for i=1, rots do
      cardinalLeft()
      didTurn = turtle.turnLeft()

    end
    return didTurn
  end

  local function fTL()
    for i=1, rots do
      cardinalLeft()
      print('Fake turnLeft')
    end
    return true
  end

  turtleExists(tl, fTL)

end

function move.turnRight(rots)

  local function tr()
    local turtle = turtle or {} -- This wont be used, but it prevents errors while debugging
    local didTurn = nil
    for i=1, rots do
      cardinalRight()
      didTurn = turtle.turnRight()

    end

    return didTurn
  end

  local function fTR()
    for i=1, rots do
      cardinalRight()
      print('Fake turnRight')
    end
    return true
  end

  return turtleExists(tr, fTR)

end

-- End Turns

-- Movements

function move.forward(spaces)
  local obstacle = false
  local turtle = turtle or {}
  local function mF()

    for i=1, spaces do

      if turtle.detect() == true then
        obstacle = true
        print("obstacleDetected")
        break
      end

      turtle.forward()
    end
  end

  local function fMF()

    for i=1, spaces do
      print('Fake: forward()');
    end

  end

  return turtleExists(mF, fMF)

end

function move.backward(spaces)

  move.turnLeft(2)
  move.forward(spaces)
  move.turnLeft(2)

end

function move.left(spaces)
  -- Turn left then move
  move.turnLeft(1)
  move.forward(spaces)
  move.turnRight(1)
end

function move.right(spaces)
  move.turnRight(1)
  move.forward(spaces)
  move.turnLeft(1)
end

function move.up(spaces)
 local function mU()
   for i=1, spaces do 
     turtle.up() 
   end
 end
 
 local function fMU()
   for i=1, spaces do
     print("fake move up")
   end
 end
 return turtleExists(mU, fMU)
end

function move.down(spaces)
 local function mU()
   for i=1, spaces do 
     turtle.down() 
   end
 end
 
 local function fMU()
   for i=1, spaces do
     print("fake move down")
   end
 end
 return turtleExists(mU, fMU)
end
-- End Movements

move.up(3)
move.forward(3)
move.backward(3)
move.down(3)


return move

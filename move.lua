local move = {}

move.history = {}
turtle = {}
function turtle.turnLeft()
 print('Turtle turning left')
 return true
end
function turtle.turnRight()
 print('Turtle turning Right')
 return true
end
function turtle.forward()
 print('Turtle moving forward')
 return true
end
function turtle.detect()
return false
end
-- Utils

local function turtleExists(success, error)
  if turtle ~= nil then
    return success()
  end
  return error()
end

-- End Utils

-- Turns

function move.turnLeft(rots)

  local function tl()
    local turtle = turtle or {} -- This wont be used, but it prevents errors while debugging
    local didTurn = nil
    for i=1, rots do
      didTurn = turtle.turnLeft()

    end
    return didTurn
  end

  local function fTL()
    for i=1, rots do
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
      didTurn = turtle.turnRight()

    end

    return didTurn
  end

  local function fTR()
    for i=1, rots do
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

end
-- End Movements

move.turnRight(3)
move.turnLeft(2)
move.turnRight(3)
move.backward(3)
move.left(4)


return move

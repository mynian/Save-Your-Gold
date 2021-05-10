--Create Function to round the decimals
local function mathround(number, precision)
  precision = precision or 0
  local decimal = string.find(tostring(number), ".", nil, true);  
  if ( decimal ) then  
    local power = 10 ^ precision;    
    if ( number >= 0 ) then 
      number = math.floor(number * power + 0.5) / power;
    else 
      number = math.ceil(number * power - 0.5) / power;    
    end    
    -- convert number to string for formatting 
    number = tostring(number);    
    -- set cutoff
    local cutoff = number:sub(decimal + 1 + precision);      
    -- delete everything after the cutoff
    number = number:gsub(cutoff, "");
  else
    -- number is an integer
    if ( precision > 0 ) then
      number = tostring(number);      
      number = number .. ".";      
      for i = 1,precision
      do
        number = number .. "0";
      end
    end
  end    
  return number;
end

--Create Basic framework for addon
local sygframe, sygevents = CreateFrame("Frame", "SaveYourGold"), {};

--Defaulting saved gold amount
sygsavedamount = 0

local function addgold(amount)
    amount = amount or 0
    sygsavedamount = tonumber(sygsavedamount) + tonumber(amount)
end

local function subtractgold(amount)
    amount = amount or 0
    sygsavedamount = tonumber(sygsavedamount) - tonumber(amount)
    if sygsavedamount < 0 then
        sygsavedamount = 0
    end
end
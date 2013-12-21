function v = checkBounds( x )

global bounds D;

v = x;
low = bounds(1);
high = bounds(2);

for i = 1 : D
    if( x(i) >= high || x(i) <= low ) 
        v(i) = low + rand() * (high - low);
    end
end

end


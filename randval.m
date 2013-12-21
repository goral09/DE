function random = randval(l, h, D)
    random = zeros([1 D]);
    for i = 1 : D
        random(i) = l + rand() * (h - l);
    end

end
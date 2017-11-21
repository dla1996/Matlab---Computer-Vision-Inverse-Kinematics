function increaseNumClicks()
    global numClicks;
    if numClicks == 2
        numClicks = 0;
    end
    numClicks = numClicks + 1;
    numClicks;
end
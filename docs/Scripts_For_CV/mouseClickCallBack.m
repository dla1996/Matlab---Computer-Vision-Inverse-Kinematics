function mouseClickCallBack(hObject,eventdata)
    global xPos yPos numClicks
    notInside = 'Point not inside image';
    clickedPt = get(gca,'CurrentPoint');
%     disp(clickedPt)
    xPos = clickedPt(1,1)
    yPos = clickedPt(1,2)
    % If statement to check if clicked point is within image
    
    if (round(clickedPt(1,1)) < 960)  && (round(clickedPt(1,1)) > 0) && (round(clickedPt(1,2)) < 540) && (round(clickedPt(1,2)) > 0)
        increaseGlobalNumClicks()
        
    else
        disp(notInside)
        disp(clickedPt)
    end
end
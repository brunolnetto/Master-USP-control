function simulate(sims, mechanism)
    n = length(sims);
       
    % Draw mechanism movement
    for i = 1:n
         draw_mechanism(mechanism, sims{i});
         pause(sims{i}.curr_t - sims{i}.prev_t);
         
         F(i) = getframe(gcf) ;
    end
    
    % create the video writer with 1 fps
    writerObj = VideoWriter('multibody.avi');
    writerObj.FrameRate = 10;

    % open the video writer
    open(writerObj);
    % write the frames to the video
    for i=1:length(F)
        % convert the image to a frame
        frame = F(i) ;    
        writeVideo(writerObj, frame);
    end
    % close the writer object
    close(writerObj);
end
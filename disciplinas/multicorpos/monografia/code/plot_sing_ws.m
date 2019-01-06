
ps_ws = [];
for i = q:length(is_wss)
    if(is_wss(i))
        ps_ws = [ps_ws; points(i, :)];
    end
end

figure()
plot3(ps_ws(:, 1), ps_ws(:, 2), ps_ws(:, 3), 'kx');

% ps_s = [];
% for i = q:length(is_sings)
%     if(is_sings(i))
%         ps_s = [ps_s; points(i, :)];
%     end
% end
% 
% figure()
% plot3(ps_s(:, 1), ps_s(:, 2), ps_s(:, 3), 'mx');
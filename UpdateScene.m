function UpdateScene(carX,Title)
% アニメーションを更新する関数
figure(1);
clf
hold on
mapX = -5:pi/100:5;
mapY = Map(mapX);
plot(mapX,mapY);
xlim([-1.1 0.5]);
t = title(Title);
set(t,'FontSize',16);
carY = Map(carX);
drawCar(carX, carY);

goalX = 0.5;
goalY = Map(0.5);
drawGoal(goalX, goalY)
pause(0.01);
    function drawCar(x,y)
        % カートの描画
        plot(x,y,'or','LineWidth',4);
    end
    function drawGoal(x,y)
        % ゴール地点を描画
        plot(x,y,'--gs','LineWidth',2,'MarkerSize',5,'Color',[0,0,1])
    end
end

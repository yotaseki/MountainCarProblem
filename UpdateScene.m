function UpdateScene(Sim,Title)
% アニメーションを更新する関数
clf
hold on
mapX = -5:pi/100:5;
mapY = Map(mapX);
plot(mapX,mapY);
xlim([-1.1 0.5]);
t = title(Title);
set(t,'FontSize',16);
carY = Map(Sim.car.x);
drawCar(Sim.car.x, carY);

goalY = Map(Sim.goal.x);
drawGoal(Sim.goal.x, goalY)
pause(0.02);
    function drawCar(x,y)
        % カートの描画
        plot(x,y,'or','LineWidth',4);
    end
    function drawGoal(x,y)
        % ゴール地点を描画
        plot(x,y,'--gs','LineWidth',2,'MarkerSize',5,'Color',[0,0,1])
    end

end

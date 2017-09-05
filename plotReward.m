clear all;
syms x;
figure;
hold on
fplot(x,RewardTest2(x),[-1 0.5]);
figure
fplot(x,RewardTest(x),[-1 0.5]);
title("Reward")
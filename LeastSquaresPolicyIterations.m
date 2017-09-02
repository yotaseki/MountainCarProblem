function theta = LeastSquaresPolicyIterations(car, L, M, T, options )
%REINFORCEMENTLEARNING 強化学習
%   L        ;政策反復回数
%   M        ;エピソード数
%   T        ;ステップ数
B = length(options.centers); % 基底関数の数
nactions = length(car.Actions); % 行動数
paction = 0;
pstate = 0;
% デザイン行列
X = zeros(M*T,B*nactions);
% ベクトルr初期化
r = zeros(M*T,1);
% モデルパラメータ初期化
theta = zeros(B*nactions,1);
% 政策反復
for l=1:L
    disp(['policy :' ,num2str(l)])
    dr = 0;
    rand('state',1);
    for m=1:M
        % disp(['episode :',num2str(m)])
        Sim = ResetSimulation;
        for t=1:T+1
            car = Sim.car;
            % 状態の観測
            state = [car.v;car.x;car.a];
           % disp(state)
            % ==========================
            % 距離
            dist = sum((options.centers - repmat(state',B,1)).^2,2);
           % disp(size(options.centers))
           % disp(size(repmat(state',B,1)))
            % 現在の状態における基底関数
            phis = exp(-dist/2/(options.var^2));
            % 現在の状態における価値関数
            Q = phis'*reshape(theta,B,nactions);
            % ==========================
            % 政策
            policy = zeros(nactions,1);
            % e-greedy
            [v, a] = max(Q);
           %disp([v,a])
            policy = ones(nactions,1)*options.epsilon/nactions;
            policy(a) = 1 - options.epsilon+options.epsilon/nactions;
           %disp([1 options.epsilon options.epsilon/nactions])
           %disp(policy);
            % 行動選択
            ran = rand;
            if(ran < policy(1))
                action = 1;
            elseif(ran < policy(1)+policy(2))
                action = 2;
            else
                action = 3;
            end
            % 行動の実行
            car.a = car.Actions(action);
            car.v = car.v + (-9.8*car.m*cos(3*car.x) + car.a/car.m - Sim.k*car.v)*Sim.dt;
            car.x = car.x + car.v*Sim.dt;
            Sim.car = car;
            if and(not(rem(l,1)) ,not(rem(m,M)))
                UpdateScene(Sim,"L="+num2str(l));
            end
            
            if t>1
                % 現在の状態に関する基底関数の政策に関する平均
                aphi = zeros(B*nactions,1);
                for a=1:nactions
                    % getPhi 基底関数のベクトル
                    aphi = aphi + getPhi(state, a ,options.centers,B,options.var,nactions) * policy(a);
                end
                % 一つ前の状態と行動に関する基底関数
                pphi = getPhi(pstate,paction,options.centers,B,options.var,nactions);
                % (M*T)*Bデザイン行列X, M*T次元ベクトルr
                X(T*(m-1)+t-1,:) = (pphi - options.gamma * aphi)';
                r(T*(m-1)+t-1) = -cos(state(1));
                
                % 割引き和の計算
                dr = dr+ r(T*(m-1)+t-1)*options.gamma^(t-1);
            end
            paction = action;
            pstate = state;
        end    
    end
    % 政策評価
    theta = pinv(X'*X)*X'*r;
    disp([num2str(l)+") Max="+num2str(max(r)) "Avg="+num2str(mean(r)) "Dsum="+num2str(dr/M)]);

end
    
    function P = Prob()
        % 状態遷移関数
        P = 1
    end
    function V = StateValue()
        % 状態価値関数
        V = 1
    end
    function Pi = Policy
        % 政策関数π
        Pi = 1
    end
    function R= Reward(x)
        % 報酬関数
        R = 1/ (1 - (goalX - x));
    end    
    function Q = ValueFunction
        % 状態・行動価関数
        Q = 1
    end
end


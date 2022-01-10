% Chih Jung Lee
% Exercise 7: Mini Project
% A MATLAB 2 Player Catching Game

clear all
close all
clc

pressedKey1 = 0;
pressedKey2 = 0;
screensize = get(groot,'Screensize');
dimen = [(screensize(3) - screensize(4))/2 0 screensize(4) screensize(4)];
maxSize = 30;

playerPos = [-(maxSize/2 - 5); 0];
playerMove = [0 0];
catcherPos = [maxSize/2 - 5; 0];
catcherMove = [0 0];
speed = 0.5;

[foodX1 foodY1] = foodSpawn(maxSize);
[foodX2 foodY2] = foodSpawn(maxSize);
[foodX3 foodY3] = foodSpawn(maxSize);

score = 0;

% Plot Player
scatter(playerPos(1),playerPos(2),100,'filled','b');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

% Plot Enemy
scatter(catcherPos(1),catcherPos(2),100,'filled','r');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

% Plot Food Items
scatter(foodX1,foodY1,50,'filled','magenta');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

scatter(foodX2,foodY2,50,'filled','magenta');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

scatter(foodX3,foodY3,50,'filled','magenta');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

set(gcf,'position',dimen);
set(gcf,'color','cyan');

set(gcf,'KeyPressFcn',@stroke)

% Game Stops when Enemy catches the Player
while ~checkcollision(playerPos(1,1),playerPos(2,1),catcherPos(1,1),catcherPos(2,1))
    
    % Game Stops when Player exits the Game Area
    if outofboundscheck(playerPos(1,1),playerPos(2,1),maxSize)
        break;
    end
    
    pressedKey1 = get(gcf,'CurrentKey');
    switch pressedKey1
        % player controls
        case 'w'
            playerMove(1) = 0;
            if playerMove(2) == -speed
                playerMove(2) = speed;
                playerPos = translate(playerPos,playerMove(1),playerMove(2));
            end
            playerMove(2) = speed;
            playerPos(2,1) = playerPos(2,1) + playerMove(2);
        case 's'
            playerMove(1) = 0;
            if playerMove(2) == speed
                playerMove(2) = -speed;
                playerPos = translate(playerPos,playerMove(1),playerMove(2));
            end
            playerMove(2) = -speed;
            playerPos = translate(playerPos,playerMove(1),playerMove(2));
        case 'd'
            playerMove(2) = 0;
            if playerMove(1) == -speed
                playerMove(1) = speed;
                playerPos = translate(playerPos,playerMove(1),playerMove(2));
            end
            playerMove(1) = speed;
            playerPos = translate(playerPos,playerMove(1),playerMove(2)); 
        case 'a'
            playerMove(2) = 0;
            if playerMove(1) == speed
                playerMove(1) = -speed;
                playerPos = translate(playerPos,playerMove(1),playerMove(2));
            end
            playerMove(1) = -speed;
            playerPos = translate(playerPos,playerMove(1),playerMove(2));
        % keep player inertia if another key is pressed
        otherwise
            playerPos = translate(playerPos,playerMove(1),playerMove(2));
    end
    
    pressedKey2 = get(gcf,'CurrentKey');
    switch pressedKey2
        % enemy controls
        case 'uparrow'
            catcherMove(1) = 0;
            if catcherMove(2) == -speed
                catcherMove(2) = speed;
                catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
            end
            catcherMove(2) = speed;
            catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
        case 'downarrow'
            catcherMove(1) = 0;
            if catcherMove(2) == speed;
                catcherMove(2) = -speed;
                catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
            end
            catcherMove(2) = -speed;
            catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
        case 'rightarrow'
            catcherMove(2) = 0;
            if catcherMove(1) == -speed
                catcherMove(1) = speed;
                catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
            end
            catcherMove(1) = speed;
            catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
        case 'leftarrow'
            catcherMove(2) = 0;
            if catcherMove(1) == speed
                catcherMove(1) = -speed;
                catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
            end
            catcherMove(1) = -speed;
            catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
        % keep enemy inertia if another key is pressed
        otherwise
            catcherPos = translate(catcherPos,catcherMove(1),catcherMove(2));
    end
    
    % Updating player score
    if [playerPos(1,1) playerPos(2,1)] == [foodX1 foodY1]
        [foodX1 foodY1] = foodSpawn(maxSize);
        score = score + 1;
    elseif [playerPos(1,1) playerPos(2,1)] == [foodX2 foodY2]
        [foodX2 foodY2] = foodSpawn(maxSize);
        score = score + 1;
    elseif [playerPos(1,1) playerPos(2,1)] == [foodX3 foodY3]
        [foodX3 foodY3] = foodSpawn(maxSize);
        score = score + 1;
    end
    
    
    clf
    
    % Continuously plot all items
    plot([-maxSize/2 -maxSize/2 maxSize/2 maxSize/2 -maxSize/2],...
        [maxSize/2 -maxSize/2 -maxSize/2 maxSize/2 maxSize/2],'k','LineWidth',4)
    hold on
    
    scatter(foodX1,foodY1,50,'filled','magenta');
    xlim([-maxSize/2 maxSize/2]);
    ylim([-maxSize/2 maxSize/2]);
    hold on
    
    scatter(foodX2,foodY2,50,'filled','magenta');
    xlim([-maxSize/2 maxSize/2]);
    ylim([-maxSize/2 maxSize/2]);
    hold on

    scatter(foodX3,foodY3,50,'filled','magenta');
    xlim([-maxSize/2 maxSize/2]);
    ylim([-maxSize/2 maxSize/2]);
    hold on
    
    scatter(playerPos(1,1),playerPos(2,1),100,'filled','b');
    xlim([-maxSize/2 maxSize/2]);
    ylim([-maxSize/2 maxSize/2]);
    hold on
    
    scatter(catcherPos(1,1),catcherPos(2,1),100,'filled','r');
    xlim([-maxSize/2 maxSize/2]);
    ylim([-maxSize/2 maxSize/2]);
    hold on
    
    drawnow
    
end

% plots remain after game ends
plot([-maxSize/2 -maxSize/2 maxSize/2 maxSize/2 -maxSize/2],...
        [maxSize/2 -maxSize/2 -maxSize/2 maxSize/2 maxSize/2],'k','LineWidth',4)
hold on
    
scatter(foodX1,foodY1,50,'filled','magenta');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

scatter(foodX2,foodY2,50,'filled','magenta');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

scatter(foodX3,foodY3,50,'filled','magenta');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

scatter(playerPos(1,1),playerPos(2,1),100,'filled','b');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on
    
scatter(catcherPos(1,1),catcherPos(2,1),100,'filled','r');
xlim([-maxSize/2 maxSize/2]);
ylim([-maxSize/2 maxSize/2]);
hold on

msgbox(strcat('Score:  ',num2str(score)));
hold on

function dir = stroke(src, event)
end
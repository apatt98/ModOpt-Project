% Test points in R^2
test_points = [5.1398,4.3525;0.9611,-0.1884;-5.7962,4.1383;-4.5497,-3.4871;0,-4];
output = zeros(5,2);
radius = 1;

% Initialize figure
figure;
hold on;
axis equal;
xlabel('x');
ylabel('y');
title('Projection onto l1 Ball of Radius 6');
grid on;

% Plot the l1 ball boundary (a diamond shape)
plot([-radius, 0, radius, 0, -radius], [0, radius, 0, -radius, 0], 'b--');

% Test each point
for i = 1:size(test_points, 1)
    x = test_points(i, :);
    y = projectL1Ball(x, radius);

    output(i,:) = y;

    % Plot the original point
    plot(x(1), x(2), 'ro');

    % Plot the projected point
    plot(y(1), y(2), 'go');

    % Draw a line between the original point and the projected point
    plot([x(1), y(1)], [x(2), y(2)], 'k--');
end

legend('l1 Ball Boundary', 'Original Points', 'Projected Points', 'Location', 'Best');
hold off;
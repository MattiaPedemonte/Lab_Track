data = readtable("C:\Users\bioen\Desktop\P_vista_frontale-nd-2023-07-26\videos\filtered_data\S013_2DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
x = data(:,7);

x_elbow_r=table2array(data(:,7));
x_elbow_l=table2array(data(:,9));

y_elbow_r=table2array(data(:,8));
y_elbow_l=table2array(data(:,10));

figure(1)
plot(x_elbow_r)
hold on
plot(x_elbow_l)

figure(2)
plot(y_elbow_r)
hold on
plot(y_elbow_l)

[pks,locs] = findpeaks(y_elbow_r);
scatter(locs,pks)





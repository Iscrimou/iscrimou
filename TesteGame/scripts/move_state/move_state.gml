script_execute(get_input);

//move
xaxis = (key_right - key_left);
yaxis = (key_down - key_up);

//get direction
var dir = point_direction(0, 0, xaxis, yaxis);

//length
if (xaxis == 0) and (yaxis == 0)
{
len = 0;
}else
{
len = spd;
}

//get speed variables
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

#region collision
//horizontal collision
if place_meeting(x+hspd, y, obj_wall){
	while !place_meeting(x+hspd, y, obj_wall){
		x+=sign(hspd);
	}
	hspd = 0;
}
x+=hspd;

//vertical collision
if place_meeting(x, y+vspd, obj_wall){
	while !place_meeting(x, y+vspd, obj_wall){
		y+=sign(vspd);
	}
	vspd = 0;
}
y+=vspd;

#endregion
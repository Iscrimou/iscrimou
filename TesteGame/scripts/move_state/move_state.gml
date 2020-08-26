script_execute(get_input);

#region Move
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

#region Collision
//horizontal collision
if place_meeting(x+hspd, y, obj_wall) or place_meeting(x+hspd, y, obj_wallinv){
	while !place_meeting(x+hspd, y, obj_wall){
		x+=sign(hspd);
	}
	hspd = 0;
}
x+=hspd;

//vertical collision
if place_meeting(x, y+vspd, obj_wall) or place_meeting(x, y+vspd, obj_wallinv){
	while !place_meeting(x, y+vspd, obj_wall){
		y+=sign(vspd);
	}
	vspd = 0;
}
y+=vspd;

//horizontal collision
/*if place_meeting(x+hspd, y, obj_wallinv){
	while !place_meeting(x+hspd, y, obj_wallinv){
		x+=sign(hspd);
	}
	hspd = 0;
}
x+=hspd;

//vertical collision
if place_meeting(x, y+vspd, obj_wallinv){
	while !place_meeting(x, y+vspd, obj_wallinv){
		y+=sign(vspd);
	}
	vspd = 0;
}
y+=vspd;*/
#endregion

#endregion

//Control Sprite
image_speed = sign(len)*.9

if (len == 0){
	image_index = 0;
}

if (hspd > 0){
	sprite_index = spr_player_right
}
else if (hspd < 0){
	sprite_index = spr_player_left	
}
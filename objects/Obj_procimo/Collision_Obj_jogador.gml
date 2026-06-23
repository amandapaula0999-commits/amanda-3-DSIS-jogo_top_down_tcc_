//// se encostar vai para a procima room 


if(room_next(room) != -1)
{// se a procima room é diferente de -1 ou seja ela existe eu avanso
	room_goto_next();	
}
/// caso não tenha mais rooms eu volto 
else
{
	room_goto(inicio)
}

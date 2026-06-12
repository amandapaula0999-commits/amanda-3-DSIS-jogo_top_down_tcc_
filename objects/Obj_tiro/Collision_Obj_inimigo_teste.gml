// Colisão do Obj_tiro com o Obj_inimigo_
if (instance_exists(other))
{
	
    
    
    with (other) 
	{
        scr_inimigo_receber_dano(other.dano);
    }
    
    instance_destroy();
}



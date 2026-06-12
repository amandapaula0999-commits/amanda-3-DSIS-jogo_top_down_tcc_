// Evento de COLISÃO do Obj_rit com Obj_inimigo_teste
with(other) 
{
    hp_atual -= 4; // Use hp_atual para bater com o nome que está no Create do inimigo
}



instance_destroy(); // Destrói o hit de ataque
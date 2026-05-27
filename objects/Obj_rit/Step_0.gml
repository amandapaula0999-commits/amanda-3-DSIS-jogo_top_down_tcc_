tempo_de_vida += 1;// contador 


// Se ele existir por menos de 6 frames some
if (tempo_de_vida > 6) { 
    instance_destroy(); 
}

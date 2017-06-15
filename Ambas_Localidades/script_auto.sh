#!/bin/sh

#O simulador escolhido foi o DineroIV porque é um simulador que roda na linha de comando, logo, facilita a criação de scripts de automatização.
#O simulador Amnesia do professor lê rastros no padrão do Dinero, então cumpre o que ele pede.
#A arquitetura no Dinero são passados por argumentos na linha de comando, ou seja, não precisa editar arquivo XML um por um.

#Cache unificada BASE de tamanho 512B, blocos de 4B, mapeamento direto, política de substituição LRU, formato dinero tradicional.
#Associatividade 1 e substituição LRU foram escolhidos para a arquitetura base por ser o padrão do DineroIV.
#O padrão do DineroIV também utiliza política Write-Back que é desconsiderado para o trabalho.
../d4-7/dineroIV -l1-usize 512 -l1-ubsize 4 -l1-uassoc 1 -l1-urepl l -informat d < Trace.din > Output.txt

#Cache unificada nível 1 de tamanho 1024B, blocos de 4B, mapeamento direto, política de substituição LRU, formato dinero tradicional.
#Primeira variação da arquitetura base com rastro sem princípio nenhum = tamanho de cache dobrada.
../d4-7/dineroIV -l1-usize 1024 -l1-ubsize 4 -l1-uassoc 1 -l1-urepl l -informat d < Trace.din > Output_CacheSize128B.txt

#Cache unificada nível 1 de tamanho 512B, blocos de 8B, mapeamento direto, política de substituição LRU, formato dinero tradicional.
#Segunda variação da arquitetura base com rastro sem princípio nenhum = tamanho de bloco dobrado.
../d4-7/dineroIV -l1-usize 512 -l1-ubsize 8 -l1-uassoc 1 -l1-urepl l -informat d < Trace.din > Output_BlockSize8B.txt

#Cache unificada nível 1 de tamanho 512B, blocos de 4B, totalmente associativa, política de substituição LRU, formato dinero tradicional.
#Terceira variação da arquitetura base com rastro sem princípio nenhum = tamanho de cache dobrada.
#De acordo com o manual do DineroIII cache totalmente associativa = tamanho da cache/tamanho do bloco
../d4-7/dineroIV -l1-usize 512 -l1-ubsize 4 -l1-uassoc 64 -l1-urepl l -informat d < Trace.din > Output_TotalAssoc.txt

#Cache unificada nível 1 de tamanho 512B, blocos de 4B, mapeamento direto, política de substituição FIFO, formato dinero tradicional.
#Quarta variação da arquitetura base com rastro sem princípio nenhum = tamanho de cache dobrada.
../d4-7/dineroIV -l1-usize 512 -l1-ubsize 4 -l1-uassoc 1 -l1-urepl f -informat d < Trace.din > Output_FIFO.txt

#Cache unificada L2 de tamanho 1024B, blocos de 4B, mapeamento direto, política de substituição LRU, formato dinero tradicional.
#Quinta variação da arquitetura base com rastro sem princípio nenhum = tamanho de cache dobrada.
../d4-7/dineroIV -l1-usize 512 -l1-ubsize 4 -l1-uassoc 1 -l1-urepl l \
-l2-usize 1024 -l2-ubsize 4 -l2-uassoc 1 -l2-urepl l -informat d < Trace.din > Output_L2Dobrada.txt

#Cache unificada L2 de tamanho 1024B (propositalmente o dobro da L1), blocos de 8B, mapeamento direto, política de substituição LRU, formato dinero tradicional.
#Sexta variação da arquitetura base com rastro sem princípio nenhum = tamanho de cache dobrada.
../d4-7/dineroIV -l1-usize 512 -l1-ubsize 4 -l1-uassoc 1 -l1-urepl l \
-l2-usize 1024 -l2-ubsize 8 -l2-uassoc 1 -l2-urepl l -informat d < Trace.din > Output_L2AmbosDobrados.txt

#Cache unificada L2 de tamanho 128B (propositalmente o dobro da L1), blocos de 2B, mapeamento direto, política de substituição FIFO, formato dinero tradicional.
#Sétima variação da arquitetura base com rastro sem princípio nenhum = tamanho de cache dobrada.
../d4-7/dineroIV -l1-usize 512 -l1-ubsize 4 -l1-uassoc 1 -l1-urepl l \
-l2-usize 1024 -l2-ubsize 4 -l2-uassoc 1 -l2-urepl f -informat d < Trace.din > Output_L2DobradaFIFO.txt



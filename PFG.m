a = readtable("Variables_Apache.xlsx");
datos = table2array(a);

% Cogemos las variables

% Calculo apache 

nrows = size(a,1);
p_apache = zeros(nrows,1);


for i=1:nrows

    % Calculo Edad
    p = 0;
    if datos(i,3) >= 75
        p = 6;
    
    elseif datos(i,3) >= 65
        p = 5;

    elseif datos(i,3) >= 55
        p = 3;
   

    elseif datos(i,3) >= 45
        p = 2;

    end

    % Calculo Creatinina
    if datos(i,4) >= 3.5
        p = p + 4;

    elseif datos(i,4) >= 2
        p = p + 3;

    elseif datos(i,4) >= 1.5
        p = p + 2;
         
    elseif datos(i,4) < 0.6
        p = p + 2;

    end

    % Calculo FiO2
    if datos(i,5) < 0.5
        
        if datos(i,6) < 55
            p = p + 4;

        elseif datos(i,6) <= 60
            p = p + 3;

        elseif datos(i,6) <= 70
            p = p + 1;
        end
    end
    
     % Calculo GCS
     p = p + 15 - datos(i,7);

    % Calculo Frec. Cardiaca
    if datos(i,8) >= 180
        p = p + 4;

    elseif datos(i,8) >= 140
        p = p + 3;

    elseif datos(i,8) >= 55 && datos(i,8) < 70
        p = p + 2;
         
    elseif datos(i,8) >= 40
        p = p + 3;
          
    elseif datos(i,8) < 40
        p = p + 4;

    end

    % Calculo Hematocritos
    if datos(i,9) >= 60
        p = p + 4;

    elseif datos(i,9) >= 50
        p = p + 2;

    elseif datos(i,9) >= 46 
        p = p + 1;
          
    elseif datos(i,9) >= 20 && datos(i,9) < 30
        p = p + 2;
        
    elseif datos(i,9) < 20
        p = p + 4;

    end
    
    % Calculo Presion arterial
    if datos(i,10) >= 160  || datos(i,10) < 50
        p = p + 4;

    elseif datos(i,10) >= 130
        p = p + 3;

    elseif datos(i,10) >= 110 || datos(i,10) >= 50 && datos(i,10)<70
        p = p + 2;

    end
   
    % Calculo pH
    if datos(i,11) >= 7.7 || datos(i,11) < 7.15
        p = p + 4;

    elseif datos(i,11) >= 7.6 && datos(i,11) < 7.7 || datos(i,11) >= 7.15 && datos(i,11) < 7.25 
        p = p + 3;
         
    elseif datos(i,11) >= 7.25 && datos(i,11) < 7.33 
        p = p + 2;

    elseif datos(i,11) >= 7.5 && datos(i,11) < 7.6 
        p = p + 1;

    end
    
    % Calculo Respiración
    if datos(i,12) >= 50 || datos(i,12) < 6
        p = p + 4;

    elseif datos(i,12) >= 35 && datos(i,12) < 50 
        p = p + 3;

    elseif datos(i,12) >= 10 && datos(i,12) < 12 || datos(i,12) >= 12 && datos(i,12) < 25 
        p = p + 1;

    end

    % Calculo Sodio
    if datos(i,13) >= 180 || datos(i,13) < 111
        p = p + 4;

    elseif datos(i,13) >= 160 && datos(i,13) < 180 || datos(i,13) >= 111 && datos(i,13) < 120 
        p = p + 3;
         
    elseif datos(i,13) >= 155 && datos(i,13) < 160 || datos(i,13) >= 120 && datos(i,13) < 130
        p = p + 2;

    elseif datos(i,13) >= 150 && datos(i,13) < 155
        p = p + 1;

    end

    % Calculo Temperatura
    if datos(i,14) >= 41 || datos(i,14) < 30
        p = p + 4;

    elseif datos(i,14) >= 39 && datos(i,14) < 41 || datos(i,14) >= 30 && datos(i,14) < 32 
        p = p + 3;
         
    elseif  datos(i,14) >= 32 && datos(i,14) < 34 
        p = p + 2;

    elseif datos(i,14) >= 38.5 && datos(i,14) < 39 || datos(i,14) >= 34 && datos(i,14) < 36
        p = p + 1;

    end

    % Calculo Leucocitos
    if datos(i,15) >= 40 || datos(i,15) < 1
        p = p + 4;
         
    elseif  datos(i,15) >= 20 && datos(i,15) < 40 || datos(i,15) >= 1 && datos(i,15) < 3
        p = p + 2;

    elseif datos(i,15) >= 15 && datos(i,15) < 20 
        p = p + 1;

    end

    % Calculo Potasio
    if datos(i,16) >= 7 || datos(i,16) < 2.5
        p = p + 4;
         
    elseif  datos(i,16) >= 6 && datos(i,16) < 7 
        p = p + 3;

    elseif  datos(i,16) >= 2.5 && datos(i,16) < 3
        p = p + 2;

    elseif datos(i,16) >= 5.5 && datos(i,16) < 6 || datos(i,16) >= 3 && datos(i,16) < 3.5
        p = p + 1;

    end

    p_apache(i) = p;
end


%%

% Grafo escenario nominal 

p = [1 0 0 0 0 0
    .17 .26 .2 .17 .16 .04 
    .11 .21 .23 .21 .16 .08 
    .15 .17 .18 .19 .15 .16 
    .006 .065 .079 .22 .30 .33  
    0 0 0 0 0 1];

% Grafo escenario 2

p2 = [1 0 0 0 0 0
    .17 .22 .22 .19 .16 .04 
    .05 .18 .23 .24 .19 .11 
    .14 .16 .17 .18 .15 .20 
    .006 .065 .079 .20 .30 .35  
    0 0 0 0 0 1];

% Grafo escenario 3

p3 = [1 0 0 0 0 0
    .17 .3 .22 .15 .12 .04 
    .11 .24 .26 .2 .13 .06 
    .15 .21 .21 .17 .14 .12 
    .016 .085 .099 .27 .30 .23  
    0 0 0 0 0 1];

P = {p, p2, p3};

pregunta = "¿Qué escenario quiere elegir?\nSelecciona 1 si desea probar el escenario nominal, 2 si desea probar el escenario 2 o 3 si desea probar el escenario 3\n";
sol = input(pregunta);

%Creamos la cadena de markov a partir de la matriz de transición

mc = dtmc(P{sol}, 'StateNames',["Dado de Alta" "Atención en sala" "Atención reforzada" "Atención intermedia" "Atención crítica" "Fallecido"]); 

rng(22)

figure;
graphplot(mc,'ColorNodes',true)

cont_estado = zeros(1,6);
%Calculamos las probabilidades para t+1, t+2,...,t+14
for t = 1:14

    grafica = zeros(1,length(p_apache));

    for i=1:length(p_apache)
        
    % Elegimos el estado inicial según  la puntuación del paciente
    
        if p_apache(i) < 24
            
            Ei = [0 1 0 0 0 0];
            cont_estado(2) = cont_estado(2)+1;

        elseif p_apache(i) < 32
            
            Ei = [0 0 1 0 0 0];
            cont_estado(3) = cont_estado(3)+1;

        elseif p_apache(i) < 40
            cont_estado(4) = cont_estado(4)+1;
            Ei = [0 0 0 1 0 0];
            
            

        else
            Ei = [0 0 0 0 1 0];
            cont_estado(5) = cont_estado(5)+1;
    
        end
    
        % Calculamos la probabilidad del estado del paciente en el tiempo t
        prob = Ei * P{sol}^t;

        % En base a las probabilidades escogemos un valor aleatorio
        % condicionado por los pesos de las probabilidades
        
        random = rand(1);
        probabilidad_estado = prob(1);
        if random > probabilidad_estado
            probabilidad_estado = probabilidad_estado + prob(2);
            estado_probable = 2;

            if random > probabilidad_estado
                probabilidad_estado = probabilidad_estado + prob(3);
                estado_probable = 3;

                if random > probabilidad_estado
                probabilidad_estado = probabilidad_estado + prob(4);
                estado_probable = 4;

                    if random > probabilidad_estado
                    probabilidad_estado = probabilidad_estado + prob(5);
                    estado_probable = 5;

                        if random > probabilidad_estado
                        probabilidad_estado = probabilidad_estado + prob(6);
                        estado_probable = 6;
                        end
                    end
                end
            end 

        else
            estado_probable = 1;
        end
      
        grafica(i) = estado_probable;

    end
    
    x = (1:6);
    count = zeros(6,1);
    for k = 1:6
        count(k) = sum(grafica==k);
    end

    % Gráfica la distribución de pacientes en los dias pares

    if mod(t,2)==0
        disp(['Número de pacientes en cada estado en el día ',num2str(t)])
        disp(" ")
        disp([ x(:) count ]);
    
        nombre_estados = categorical(["Dado de Alta","Atención en sala","Atención reforzada","Atención intermedia", "Atención crítica", "Fallecido"]);
        nombre_estados = reordercats(nombre_estados, ["Dado de Alta","Atención en sala","Atención reforzada","Atención intermedia", "Atención crítica", "Fallecido"]);
        figure
        graph = bar(nombre_estados,count);
        graph.FaceColor = 'flat';
        graph.CData(1,:) = [0.4660 0.6740 0.1880];
        graph.CData(6,:) = [0.6350 0.0780 0.1840];
        title("Distribución de pacientes en el día ",num2str(t))
    end
end

cont_estado = cont_estado./14;

% Grafico de sectores de la distribución de pacientes en t = 0
figure
graph = pie3(cont_estado(2:5));
title("Distribución inicial de pacientes")
legend(nombre_estados(2:5));

% Gráfico de sectores de supervivientes vs no supervivientes
figure        
countpie = [count(1),count(end)];
nombre_estados = [nombre_estados(1),nombre_estados(end)];
explode = [1,0];
pie3(countpie,explode)
legend(nombre_estados);

% Mapa de calor de los estados durante las 14 etapas
numSteps = 14;
x0 = cont_estado;
X1 = simulate(mc,numSteps,'X0',x0);
figure;
simplot(mc,X1);

% Mapa de calor de los cambios de estado
figure;
simplot(mc,X1,'Type','transitions');
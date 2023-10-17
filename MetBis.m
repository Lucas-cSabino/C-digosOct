clc
f = @(x) e^x - 2 - cos(e^x-2); %função em que será encontrada a raiz
a = 0.5; %intervalo a de [a,b]
b = 1.5; %intervalo b de [a,b]
TOL = 10^(-5); %tolerância de erro
N = 10; %número máximo de iterações
i = 0; %variável i armazena a iteração atual
fa=f(a); %fa recebe a função no ponto a
while i <= N %começa o método da bissecao
  p = a+(b-a)/2; %ponto médio de [a,b]
  fp = f(p); %fp recebe a função no ponto p
  if (fp == 0) || ((b-a)/2 < TOL) %condicional de parada
    display(["Procedimento concluído com sucesso após ", num2str(i+1), " iterações"])
    p %se uma das condições for satisfeita, então p é a raiz da função
    break %sai do loop
  endif
  %Caso as condições não sejam satisfeitas, é preparado a nova iteração
  i=i+1; %incremento de i
  if (fa*fp > 0) %verificação de sinais 
    a = p; %a recebe o valor atual de p
    fa = fp; %fa recebe fp
  else %caso f(a) * f(p) < 0 
    b=p; %b é atualizado com p
  endif
endwhile
if i > N %mensagem de erro caso I > N
  display('Numero máximo de iterações excedido!')
  p %Valor de p no momento em que I > N
endif
function [x] = GSeidel(A, b, x, tol, N) %recebe os parametros
  clc %Limpa a tela
  E = [A,b] %Matriz aumentada E = [A|b]
  n = size(A,1); %Recebe quantas incógnitas existem em A
  k = 0; %Valor inicial da iteração
  x0 = x; %x0 recebe a aproximação inicial
  while k <= N %Condicional de parada da iteração
    for i = 1:n %Começa a iteração das linhas
      s = 0;  %Define uma variável para o somatório
      for j = 1:n %Começa a iteração das colunas
        if j != i %Condicional para o somatório
          s = s + A(i,j)*x(j);  %Somatório com os valores sol. mais atuais
        endif
      endfor
      x(i) = (b(i) - s)/A(i,i); %Armazena o vetor solução para k+1
    endfor
    eps = norm(x-x0, 'inf'); %Armazenando a norma em uma variável
    if eps < tol  %Condicional de parada
      display('O procedimento foi bem-sucedido')
      display(["Foram realizados ", num2str(k+1), " iterações"])
      return
    endif
    x0 = x %Salvando o novo vetor solução x em x0
    k += 1; %Incrementa k para a nova iteração
  endwhile  %Fim da iteração caso k>N
  display('Número máximo de iterações excedido')
endfunction
%GSeidel([10,-1,2,0;-1,11,-1,3;2,-1,10,-1;0,3,-1,8],[6;25;-11;15],[0,0,0,0],10^(-3), 5)
%GSeidel([2,-1;1,2],[1;3],[0,0],10^(-2), 10)
%GSeidel([20,1,1,2;1,10,2,4;1,2,10,1;2,4,1,20],[33;38.4;43.5;45.6],[0,0,0,0],10^(-2), 100)

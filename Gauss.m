function [x] = Gauss(A, b)
E = [A,b]
n = size(E,1);
for i=1:n-1 %inicia o processo de eliminação
  for p=i:n % percorrer todas as linhas da diagonal para abaixo
    if E(p,i)!=0 %fixei a coluna da diagonal i
      break %sai do for em p
    endif
  endfor
L = E(p,:); %Armazena a linha E(p,:) em L
E(p,:) = E(i,:); %E(p,:) recebe E(i,:)
E(i,:) = L; %Troca de linha efetuada
  for j = i+1:n 
    if E(i,i) != 0 %Se o pivô for não nulo...
      m(j,i) = E(j,i)/E(i,i); %Define os multiplicadores m
      E(j,:)-= m(j,i)*E(i,:); %Se o pivô é não nulo, ocorre então a eliminação
    else %Caso não exista um pivô diferente de zero
      E %Exibe a matriz aumentada impossível de ser resolvida
      error('Não existe uma solução única')
    endif
  endfor
endfor
if E(n,n) == 0 %Caso impossível
  error('Não existe uma solução única')
endif
display('E após a troca')
E %Exibe a matriz aumentada transformada em matriz triangular superior
x(n) = E(n,n+1)/E(n,n); %Começa a substituição regressiva
for i = n-1:-1:1
  S=0; %Define uma variável para o somatório
  for j=i+1:n
    S=S+E(i,j)*x(j); %Define um somatório
  endfor
  x(i) = (E(i,n+1) - S)/E(i,i); %vetor solução do sistema
endfor
x(:,i)
endfunction
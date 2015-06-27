// funzione per scelta dei mesi tramite tasti
int keyPressed( int cont)
{
  if (key == '1')
  {
    cont=0;
  } 
  if (key == '2')
  {
    cont=1;
  } 
  if (key == '3')
  {
    cont=2;
  } 
  if (key == '4')
  {
    cont=3;
  }  
  if (key == '5')
  {
    cont=4;
  } 
  if (key == '6')
  {
    cont=5;
  } 
  if (key == 'q')
  {
    cont=6;
  }  
  if (key == 'w')
  {
    cont=7;
  }  
  if (key == 'e')
  {
    cont=8;
  } 
  if (key == 'r')
  {
    cont=9;
  }  
  if (key == 't')
  {
    cont=10;
  } 
  if (key == 'y')
  {
    cont=11;
  }

  return cont;
}

/* Transposes data in file
 * The number of COLUMNS must be EXACT and 
 * the data must have CONSTANT number of columns except for the last line */

#define integer int
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char *argv[])
{  
  integer i, j, n;
  integer nRow, nCol;
  string name;
  string *data;
  ifstream ifile;
  ofstream ofile;

  switch(argc){
  case 2:
    name = argv[1];
    cout << "number of rows: ";
    cin >> nRow;
    cout << "number of columns: ";
    cin >> nCol;
    break;
  case 4:
    name = argv[1];
    nRow = atoi(argv[2]);
    nCol = atoi(argv[3]);
    break;
  default:
    cout << "name of the file: ";
    cin >> name;
    cout << "number of rows: ";
    cin >> nRow;
    cout << "number of columns: ";
    cin >> nCol;
    break;
  }
  
  ifile.open(name);
  n = nRow*nCol;
  data = new string[n];
  for (i=0;i<n;i++){
    ifile >> data[i];
  }
  ifile.close();
  
  name = "t_" + name;  
  ofile.open(name);
  for (i=0;i<nCol;i++){
    for (j=0;j<nRow;j++){  
      ofile << data[i+j*nCol] << "\t";
    }
    ofile << endl;
  }
  ofile.close();
  delete[] data;
  return 0;
}

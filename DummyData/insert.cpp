#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <cstring>

#define INFILE "Deliverables.txt"
#define OUTFILE "Deliverables.sql"

using namespace std;

bool is_number(const string& s) {
    string::const_iterator it = s.begin();
    while (it != s.end() && isdigit(*it)) ++it;
    return !s.empty() && it == s.end();
}

bool is_date(const string& s) {
    string::const_iterator it = s.begin();
    while (it != s.end() && *it != '/') ++it;
    return !s.empty() && it != s.end();
}


int main() {
    FILE* in = fopen(INFILE, "r");
    FILE* out = fopen(OUTFILE, "w");
    char ch;

    if (NULL == in) {
        printf("in\n");
    }

    if (NULL == out) {
        printf("out\n");
    }

    int ATTS, ROWS;
    fscanf(in, "%d %d\n", &ATTS, &ROWS);
    string outSk = "INSERT INTO "; // Sk stands for skeleton
    char word[400];
    fscanf(in, "%s", word); // relation name
    outSk.append(word); outSk.append(" (");

    bool description = false;
    bool department = false;
    for (int i = 0; i < ATTS; ++i) {
      fscanf(in, "%s", word); // attributes names
      // remove following if for Deliverables
      //if (strcmp(word,"description") == 0) description = true;
      if (strcmp(word,"department") == 0) description = true;
      outSk.append(word);
      if (i != ATTS - 1) outSk.append(", ");
      else outSk.append(") VALUES (");
    }

    string outFnl;
    for (int i = 0; i < ROWS; ++i) {
      outFnl = outSk;
      fscanf(in, "%s", word); // ignore first number
      for (int j = 0; j < ATTS; ++j) {
        fscanf(in, "%s", word);
        /* uncomment only for institution and make following if -> else if
        if (j == 2) {
          outFnl.append("\"");
          outFnl.append(word);
          fscanf(in, "%s", word);
          while (strcmp(word,"end") != 0) {
            outFnl.append(" ");
            outFnl.append(word);
            fscanf(in, "%s", word);
          }
          outFnl.append("\"");
        } */
        if (j == ATTS - 1 && description) {outFnl.append("\""); outFnl.append(word); fgets(word, 400, in); outFnl.append(word); outFnl.append("\"");}
        else if (j == ATTS - 1 && department) {outFnl.append("\""); outFnl.append(word); fgets(word, 400, in); outFnl.append(word); outFnl.append("\"");}
        else if (is_number(word)/* add this for ins_phone: && !(j == 1)*/) outFnl.append(word);
        else if (is_date(word)) {outFnl.append("STR_TO_DATE(\""); outFnl.append(word); outFnl.append("\",'%d/%m/%Y')");}
        else {outFnl.append("\""); outFnl.append(word); outFnl.append("\"");}
        /* \ is the escape character */
        if (j != ATTS - 1) outFnl.append(", ");
        else outFnl.append(");");
      }
      fprintf(out, "%s\n", outFnl.c_str());
    }

    // Closing the file
    fclose(in);
    fclose(out);
    return 0;
}

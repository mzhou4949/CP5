#include <stdlib.h>
#include <iostream>
#include <string.h>
#include <fstream>
#include <unordered_map>
#include <vector>

using namespace std;

int main()
{
    ifstream inputFile("test.txt");
    unordered_map<string, int> contain;
    vector<vector<string>> graph;

    if (!inputFile) {
        cerr << "Failed to open the input file." << endl;
        return 1;
    }

    string line;
    int courseKey = 0;
    while (getline(inputFile, line)) {

        vector<string> preProcessed;
        size_t index;

        while((index = line.find(" ")) != string::npos)
        {
            preProcessed.push_back(line.substr(0, index));
            line.erase(0, index + 1);
        }

        if(contain.find(preProcessed[0]) == contain.end())
        {
            contain[preProcessed[0]] = courseKey;
            courseKey++;
        }

        

    }

    inputFile.close();

    for (auto x : contain)
    {
        cout << x.first << " " << x.second << endl;
    }

    return 0;
}
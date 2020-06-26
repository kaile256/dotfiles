#include <algorithm>
#include <cstdio>
#include <iostream>
#include <string>
#include <vector>

#define REP(i, A, Z) for (auto i = (A); i < (Z); ++i)
#define RREP(i, A, Z) for (auto i = (A); i > (Z); --i)
#define rep(i, n) REP(i, 0, (n))
#define rep1(i, n) REP(i, 1, (n))
#define rrep(i, n) RREP(i, (n), 0)
#define rrep1(i, n) RREP(i, (n), 1)

#define ALL(x) (x).begin(), (x).end()
#define RALL(x) (x).rbegin(), (x).rend()

#define optimize_cin() std::ios::sync_with_stdio(!cin.tie(0))
#define pb push_back
#define endl '\n'

constexpr double MOD = 1e+9 + 7;
constexpr double EPS = 1e-12;
constexpr double PI = 3.14159265358979323846;

using ll = long long;

using std::cin;
using std::cout;
using std::iterator;
using std::vector;

template <typename T> inline void answer(vector<T> &v) {
  for (auto &&x : v)
    cout << x << ' ';
  cout << '\n';
}

template <class T> inline bool chmin(T &a, T b) {
  if (a > b) {
    a = b;
    return true;
  }
  return false;
}

template <class T> inline bool chmax(T &a, T b) {
  if (a < b) {
    a = b;
    return true;
  }
  return false;
}

int main() {
  cin.tie(0);
  std::ios::sync_with_stdio(false);

  {{_cursor_}}
}

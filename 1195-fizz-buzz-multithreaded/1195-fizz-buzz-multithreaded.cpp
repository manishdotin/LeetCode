
class FizzBuzz {
private:
    std::mutex mtx;
    std::atomic<int> index;
    int n;

public:
    FizzBuzz(int n1) : n(n1), index(1) {}

    void fizz(std::function<void()> printFizz) {
        while (index <= n) {
            std::lock_guard<std::mutex> lock(mtx);
            if (index <= n && index % 3 == 0 && index % 5 != 0) {
                printFizz();
                index++;
            }
        }
    }

    void buzz(std::function<void()> printBuzz) {
        while (index <= n) {
            std::lock_guard<std::mutex> lock(mtx);
            if (index <= n && index % 5 == 0 && index % 3 != 0) {
                printBuzz();
                index++;
            }
        }
    }

    void fizzbuzz(std::function<void()> printFizzBuzz) {
        while (index <= n) {
            std::lock_guard<std::mutex> lock(mtx);
            if (index <= n && index % 15 == 0) {
                printFizzBuzz();
                index++;
            }
        }
    }

    void number(std::function<void(int)> printNumber) {
        while (index <= n) {
            std::lock_guard<std::mutex> lock(mtx);
            if (index <= n && index % 3 != 0 && index % 5 != 0) {
                printNumber(index);
                index++;
            }
        }
    }
};

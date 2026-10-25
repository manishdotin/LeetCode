#include <semaphore.h>
#include <functional>

class FooBar {
private:
    int n;
    sem_t semaphoreFoo;
    sem_t semaphoreBar;

public:
    FooBar(int n) {
        this->n = n;
        sem_init(&semaphoreFoo, 0, 1);
        sem_init(&semaphoreBar, 0, 0);
    }

    void foo(function<void()> printFoo) {
        
        for (int i = 0; i < n; i++) {
            sem_wait(&semaphoreFoo);
        	// printFoo() outputs "foo". Do not change or remove this line.
        	printFoo();
            sem_post(&semaphoreBar);
        }
    }

    void bar(function<void()> printBar) {
        
        for (int i = 0; i < n; i++) {
            sem_wait(&semaphoreBar);
        	// printBar() outputs "bar". Do not change or remove this line.
        	printBar();
            sem_post(&semaphoreFoo);
        }
    }
};
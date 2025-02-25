#ifndef USER_COUNTER_H
#define USER_COUNTER_H

typedef struct _EF_USER_COUNTER_TYPE_ {
    __RW	COUNT;
	__RW	CTRL;
} EF_USER_COUNTER_TYPE;

typedef struct _EF_USER_COUNTER_TYPE_ *EF_USER_COUNTER_TYPE_PTR;     // Pointer to the register structure
#define USER_COUNTER ((EF_USER_COUNTER_TYPE_PTR)0x60000000)


void EF_USER_COUNTER_enable(EF_USER_COUNTER_TYPE_PTR counter) {
    counter->CTRL = 1;
};

void EF_USER_COUNTER_disable(EF_USER_COUNTER_TYPE_PTR counter) {
    counter->CTRL = 0;
};

int read_count(EF_USER_COUNTER_TYPE_PTR counter) {
    return counter->COUNT;
};

#endif // USER_COUNTER_H
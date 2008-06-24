#define PERL_CORE

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

static op_score;

static OP *(*PL_ppaddr_bak[OP_max + 1])(pTHX);

OP * count_score(pTHX) {
    PerlIO_printf(PerlIO_stderr(), "hit: %dop(%s, %s)\n", PL_op->op_type, OP_NAME(PL_op), OP_DESC(PL_op));
    op_score += PL_op->op_type;

    if (PL_op->op_type == OP_LEAVE) {
        PerlIO_printf(PerlIO_stdout(), "Your perl is : %d.%d.%d\n", PERL_REVISION, PERL_VERSION, PERL_SUBVERSION);
        PerlIO_printf(PerlIO_stdout(), "Your score is : %dop\n", op_score);
    }

    return PL_ppaddr_bak[PL_op->op_type](aTHX);
}

MODULE = Acme::PerlVMGolf		PACKAGE = Acme::PerlVMGolf

PROTOTYPES: ENABLE

BOOT:
{
    op_score = 0;
}

void
_setup()
    PROTOTYPE:
    CODE: 
        int i;
        for (i = 0;i < OP_max;i++) {
            PL_ppaddr_bak[i] = PL_ppaddr[i];
            PL_ppaddr[i]     = count_score;
        }

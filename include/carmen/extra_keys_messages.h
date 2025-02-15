/*
 * extra_keys_messages.h
 *
 *  Created on: 3 de ago. de 2022
 *      Author: lume
 */

#ifndef EXTRA_KEYS_MESSAGES_H_
#define EXTRA_KEYS_MESSAGES_H_

#include <carmen/carmen.h>
#include <carmen/global.h>
#include <carmen/extra_keys_interface.h>

//////////////////////////////////////////////////////////////////////
//defines extra_keys - keys that cannot be used: f1 e f11  		   //
////////////////////////////////////////////////////////////////////

#define KEY_TACHOGRAPH "f4"
#define KEY_AUDIT "f8"
#define DEFAULT "f2"

/////////////////////////////////////////////////////////////////////


#ifdef __cplusplus
extern "C"
{
#endif


typedef struct
{
	int device;
	char *key_char;
	double timestamp;
	char *host;
} carmen_extra_keys_message_t;

#define CARMEN_EXTRA_KEYS_NAME 	"carmen_extra_keys_message_t"
#define CARMEN_EXTRA_KEYS_FMT 	"{int,string,double,string}"


#ifdef __cplusplus
}
#endif

#endif /* EXTRA_KEYS_MESSAGES_H_ */

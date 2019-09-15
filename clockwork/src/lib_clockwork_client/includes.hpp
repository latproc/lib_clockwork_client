#include <assert.h>
#include <iostream>
#include <ostream>
#include <string>
#include <list>
#include <sys/time.h>
#include <queue>
#include <vector>

#include <cw_boost_dep.hpp>
#include <cw_curl_dep.hpp>
#include <cw_zmq_dep.hpp>

#include "helpers/includes.hpp"
#include "CommandManager.h"
#include "ConnectionManager.h"
#include "DebugExtra.h"
#include "Logger.h"
#include "MessageEncoding.h"
#include "Message.h"
#include "MessageHeader.h"
#include "MessageLog.h"
#include "MessagingInterface.h"
#include "rate.h"
#include "regular_expressions.h"
#include "SocketMonitor.h"
#include "PersistentStore.h"
#include "symboltable.h"
#include "value.h"
#include "watchdog.h"
#ifdef _WIN32
    #include "Win32Helper.h"
#else
    #include <mutex>
#endif
#ifndef RECURSIVE_LOCK
#define RECURSIVE_LOCK std::lock_guard<std::recursive_mutex>
#endif

/*
     This file is part of libhttpserver
     Copyright (C) 2011-2019 Sebastiano Merlino

     This library is free software; you can redistribute it and/or
     modify it under the terms of the GNU Lesser General Public
     License as published by the Free Software Foundation; either
     version 2.1 of the License, or (at your option) any later version.

     This library is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
     Lesser General Public License for more details.

     You should have received a copy of the GNU Lesser General Public
     License along with this library; if not, write to the Free Software
     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
     USA
*/

#if !defined (_HTTPSERVER_HPP_INSIDE_) && !defined (HTTPSERVER_COMPILATION)
#error "Only <httpserver.hpp> or <httpserverpp> can be included directly."
#endif

#ifndef _BASIC_AUTH_FAIL_RESPONSE_HPP_
#define _BASIC_AUTH_FAIL_RESPONSE_HPP_

#include "httpserver/string_response.hpp"

namespace httpserver
{

class basic_auth_fail_response : public string_response
{
    public:
        basic_auth_fail_response():
            string_response(),
            realm("")
        {
        }

        explicit basic_auth_fail_response(
                const std::string& content,
                const std::string& realm = "",
                int response_code = http::http_utils::http_ok,
                const std::string& content_type = http::http_utils::text_plain
        ):
            string_response(content, response_code, content_type),
            realm(realm)
        {
        }

        basic_auth_fail_response(const basic_auth_fail_response& other):
            string_response(other),
            realm(other.realm)
        {
        }

        basic_auth_fail_response& operator=(const basic_auth_fail_response& b)
        {
            if (this == &b) return *this;

            (string_response&) (*this) = b;
            this->realm = b.realm;

            return *this;
        }

        ~basic_auth_fail_response()
        {
        }

        int enqueue_response(MHD_Connection* connection, MHD_Response* response);

    private:
        std::string realm;
};

}
#endif // _BASIC_AUTH_FAIL_RESPONSE_HPP_

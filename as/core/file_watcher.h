//
// Created by ivn on 11.06.2024.
//

#pragma once

#include <string>
#include <vector>
#include <__filesystem/path.h>

namespace as {
class FileWatcher {

struct FileWatcherFile
{
    std::string m_path;
    std::string m_name;
    std::time_t m_old_time;
    std::time_t m_time;

    bool checkModified(const std::time_t now);
    void updateTime();
};

public:
    explicit FileWatcher(const std::string& base_path);

    void watch(const std::string& filename);
    void tick();

    template<typename T>
    bool collect(T* self, void (T::*callback)(const std::string&))
    {
        const auto now = std::time(nullptr);
        bool result = false;
        for(auto &file : m_files)
        {
            if (file.checkModified(now))
            {
                (self->*callback)(file.m_name);
                result = true;
            }
        }

        return result;
    }

    template<typename Data>
    bool collect(void (*callback)(const std::string&, Data), Data data)
    {
        const auto now = std::time(nullptr);
        bool result = false;
        for(auto &file : m_files)
        {
            if (file.checkModified(now))
            {
                callback(file.m_name, data);
                result = true;
            }
        }

        return result;
    }

private:
    std::filesystem::path m_base_path;
    std::vector<FileWatcherFile> m_files;
};

} // as

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

    bool checkModified();
    void updateTime();
};

public:
    explicit FileWatcher(const std::string& base_path);

    void watch(const std::string& filename);
    void tick();

    template<typename T>
    void collect(T* self, void (T::*callback)(const std::string&))
    {
        for(auto &file : m_files)
        {
            if (file.checkModified())
            {
                (self->*callback)(file.m_name);
            }
        }
    }

    template<typename Data>
    void collect(void (*callback)(const std::string&, Data), Data data)
    {
        for(auto &file : m_files)
        {
            if (file.checkModified())
            {
                callback(file.m_name, data);
            }
        }
    }

private:
    std::filesystem::path m_base_path;
    std::vector<FileWatcherFile> m_files;
};

} // as

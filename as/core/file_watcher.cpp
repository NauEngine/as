//
// Created by ivn on 11.06.2024.
//

#include "file_watcher.h"

#include <filesystem>

std::time_t convertToTimet(const std::filesystem::file_time_type& time)
{
    // Convert file_time_type to system_clock::time_point
    auto sctp = std::chrono::time_point_cast<std::chrono::system_clock::duration>(
                    time - std::filesystem::file_time_type::clock::now() +
                    std::chrono::system_clock::now());

    // Convert to time_t
    return std::chrono::system_clock::to_time_t(sctp);
}

std::time_t getLastWriteTime(const std::string& path)
{
    return convertToTimet(std::filesystem::last_write_time(path));
}

namespace as {
bool FileWatcher::FileWatcherFile::checkModified(const std::time_t now)
{
    if (m_old_time == m_time)
        return false;

    if (m_time > now - 1)
        return false;

    m_old_time = m_time;
    return true;
}

void FileWatcher::FileWatcherFile::updateTime()
{
    m_time = getLastWriteTime(m_path);
}

FileWatcher::FileWatcher(const std::string& base_path) :
    m_base_path(base_path)
{
}

void FileWatcher::watch(const std::string& filename)
{
    const auto path = m_base_path / filename;
    const auto time = getLastWriteTime(path);
    m_files.push_back({ path, filename, time, time });
}

void FileWatcher::tick()
{
    for(auto &file : m_files)
    {
        file.updateTime();
    }
}
} // as
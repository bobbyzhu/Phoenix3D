// PX2EngineLoop.inl

//----------------------------------------------------------------------------
inline float EngineLoop::GetElapsedTime()
{
	return (float)(mAppTime - mLastAppTime);
}
//----------------------------------------------------------------------------
inline const Sizef &EngineLoop::GetSize() const
{
	return mSize;
}
//----------------------------------------------------------------------------
inline EngineLoop::PlayType EngineLoop::GetPlayType() const
{
	return mPlayType;
}
//----------------------------------------------------------------------------